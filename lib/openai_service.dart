import 'dart:convert';

import 'package:aladdin_jin/secret.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];

  Future<String> isArtPromptAPI(String prompt) async {
    try {
      // htttp ni import qilish kerak va saytdan http linkini olish kerak
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPI_KEY',
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "Does this message want to generate an AI picture, image,art or anything similar? $prompt . Simply answer with  a yes or no. "
              }
            ],
          },
        ),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('yes response');
        String content =
            jsonDecode(response.body)['choices'][0]['messages']['content'];
        content = content.trim();

        switch (content) {
          case 'Yes':
          case 'yes':
          case 'yes.':
          case 'Yes.':
            final response = await dallEAPI(prompt);
            return response;
          default:
            final response = await chatGPTAPI(prompt);
            return response;
        }
      }
      return 'AI internal ';
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'system',
      'content': prompt,
    });

    try {
      // htttp ni import qilish kerak va saytdan http linkini olish kerak
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPI_KEY',
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": messages,
          },
        ),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('yes response');
        String content =
            jsonDecode(response.body)['choices'][0]['messages']['content'];
        content = content.trim();

        messages.add(
          {
            'role': 'assistant',
            'content': content,
          },
        );
        return content;
      }
      return 'AI internal ';
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    messages.add({
      'role': 'system',
      'content': prompt,
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPI_KEY',
        },
        body: jsonEncode(
          {
            "model": "dall-e-3",
            'prompt': prompt,
            'n': 1,
          },
        ),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('yes response');
        String imageUrl = jsonDecode(response.body)['data'][0]['url'];
        imageUrl = imageUrl.trim();

        messages.add(
          {
            'role': 'assistant',
            'content': imageUrl,
          },
        );
        return imageUrl;
      }
      return 'AI image internal ';
    } catch (error) {
      return error.toString();
    }
  }
}
