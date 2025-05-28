import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> _allArticles = [];
  List<dynamic> _filteredArticles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAndSetNews();
  }

  Future<void> _fetchAndSetNews() async {
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2025-04-28&sortBy=publishedAt&apiKey=7739b0725e63465a9a616aadcafd9569'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final articles = data['articles'];
        setState(() {
          _allArticles = articles;
          _filteredArticles = articles;
          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load news: ${response.body}");
      }
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Error fetching news: $e');
    }
  }

  void _filterNews(String query) {
    setState(() {
      _filteredArticles = _allArticles.where((article) {
        final title = article['title']?.toLowerCase() ?? '';
        return title.contains(query.toLowerCase());
      }).toList();
    });
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Feed')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search news...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _filterNews,
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _fetchAndSetNews,
                    child: _filteredArticles.isEmpty
                        ? const Center(child: Text('No Data Found!!'))
                        : ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: _filteredArticles.length,
                            itemBuilder: (context, index) {
                              final article = _filteredArticles[index];
                              final imageUrl = article['urlToImage'];
                              final title = article['title'] ?? 'No Title';
                              final description = article['description'] ?? '';
                              final source = article['source']?['name'] ??
                                  'Unknown Source';
                              final publishedAt = article['publishedAt'] ?? '';
                              final url = article['url'] ?? '';

                              String formattedDate = '';
                              try {
                                final dateTime = DateTime.parse(publishedAt);
                                formattedDate =
                                    '[${dateTime.day} ${_monthName(dateTime.month)}, ${dateTime.year}]';
                              } catch (_) {}

                              return ListTile(
                                leading: imageUrl != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(imageUrl))
                                    : const CircleAvatar(
                                        child: Icon(Icons.image)),
                                title: Text(title),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: 4),
                                    Text('Source: $source',
                                        style: const TextStyle(fontSize: 12)),
                                    Text('Published: $formattedDate',
                                        style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                                onTap: () {
                                  // Uncomment when using NewsWebViewPage
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => NewsWebViewPage(url: url),
                                  //   ),
                                  // );
                                },
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
