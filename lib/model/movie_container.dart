import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';

class MovieContianer extends StatelessWidget {
  final Result result;

  const MovieContianer({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.expand_less,
                    ),
                    Text(result.voting.toString()),
                    Icon(Icons.expand_more),
                    Text("Votes")
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(result.poster.toString())),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Genre : ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            result.genre.toString(),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Director : ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                result.director![0].toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Starring : ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  result.stars![0].toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              result.runTime == null
                                  ? "min"
                                  : "${result.runTime.toString()} min",
                              style: TextStyle(fontSize: 8),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              width: 5,
                              thickness: 2,
                            ),
                            Text(result.language.toString(),
                                style: TextStyle(fontSize: 8)),
                            VerticalDivider(
                              color: Colors.black,
                              width: 5,
                            ),
                            Text(result.releasedDate.toString(),
                                style: TextStyle(fontSize: 8))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${result.pageViews.toString()} views ",
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            width: 5,
                          ),
                          Text(
                              "Voted by ${result.totalVoted.toString()} people",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.blue))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent),
              child: Center(
                  child: Text(
                "Watch Trailer",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
