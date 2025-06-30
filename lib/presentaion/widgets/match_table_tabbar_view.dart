import 'package:flutter/material.dart';
import 'package:tornet/data/models/match_model/away_team.dart';
import 'package:tornet/data/models/match_model/competition.dart';
import 'package:tornet/data/models/match_model/data.dart';
import 'package:tornet/data/models/match_model/home_team.dart';
import 'package:tornet/data/models/match_model/match.dart';
import 'package:tornet/data/models/match_model/match_model.dart';
import 'package:tornet/presentaion/widgets/match_table_expandable_item.dart';

class MatchTableTabbarView extends StatelessWidget {
  const MatchTableTabbarView({super.key});

  static MatchModel matches = MatchModel(
    data: [
      Data(
        competition: Competition(id: "9b2b29de-1314-4b0d-a2ae-c75771022553", apiId: "0gx7lm7ph0m2wdk", name: "FIFA World Cup qualification (AFC)", logo: "https://img.thesports.com/football/competition/91ec515993bc774fdb636c7aa994a49e.png"),
        matches: [
          SingleMatch(
            id: "9c62aa75-121b-439f-853b-b4747fad4222",
            apiId: "3glrw7h73x75qdy",
            homeTeam: HomeTeam(id: "9ba3e510-c19f-4b8b-ac48-8c46e0ac8bc1", apiId: "j1l4rjnho9jm7vx", name: "Jordan", shortName: "Jordan", logo: "https://img.thesports.com/football/team/b33db33105c82718034c179607a4fa56.png", score: [0, 0, 0, 0, 0, 0, 0], shirt: "https://img.thesports.com/football/team/a54769d9dca7f2ac5a2e1b261c868993.png", isDefaultShirt: false, national: true),
            awayTeam: AwayTeam(id: "9ba3e510-fff9-4c98-b246-4ff9bdd5b408", apiId: "kn54qllhg49qvy9", name: "Iraq", shortName: "Iraq", logo: "https://img.thesports.com/football/team/85eba6905189dba3b9de6342ede53150.png", score: [0, 0, 0, 0, 0, 0, 0], shirt: "https://img.thesports.com/football/team/cc40d06ff0a16a793d066dbfa2917bab.png", isDefaultShirt: false, national: true),
            matchStatusId: 1,
            matchStatusDescription: "Not started",
            matchDay: "10/06/2025",
            matchTime: "07:00",
            kickOff: 0,
            mustDisplay: 0,
            published: 1,
          ),
          SingleMatch(
            id: "9c62a990-5033-4d98-a876-b50bf0271217",
            apiId: "6ypq3nh37277md7",
            homeTeam: HomeTeam(id: "9ba3e53d-575c-45e1-af48-a10c37ace7a1", apiId: "4jwq2gh4oyjm0ve", name: "Iran", shortName: "Iran", logo: "https://img.thesports.com/football/team/58b5d5f352fafb845b4f6755c2d5b724.png", score: [0, 0, 0, 0, 0, 0, 0], shirt: "https://img.thesports.com/football/team/56de534cf589f6d0ca09630db803ba00.png", isDefaultShirt: false, national: true),
            awayTeam: AwayTeam(
              id: "9ba3e510-bef3-46f4-bc52-0899b99ca70b",
              apiId: "4zp5rzghvgwq82w",
              name: "Korea DPR",
              shortName: "Korea DPR",
              logo: "https://img.thesports.com/football/team/b31a466bccaefaca53b4de1a843965f2.png",
              score: [0, 0, 0, 0, 0, 0, 0],
              shirt: "https://img.thesports.com/football/team/b6b90237b3ebd1e462a5d11dbc5c4dae.png",
              isDefaultShirt: false,
              national: true,
            ),
            matchStatusId: 1,
            matchStatusDescription: "Not started",
            matchDay: "10/06/2025",
            matchTime: "10:00",
            kickOff: 0,
            mustDisplay: 0,
            published: 1,
          ),
          SingleMatch(
            id: "9c62a990-b212-4743-b251-e017e4e7d4d3",
            apiId: "pxwrxlh5x6x5ryk",
            homeTeam: HomeTeam(
              id: "9ba3e50a-0d92-4923-8057-39aa65b2b4d5",
              apiId: "d23xmvkhjweqg8n",
              name: "Uzbekistan",
              shortName: "Uzbekistan",
              logo: "https://img.thesports.com/football/team/85c15864c8dc45d335bc3720c63cf2a1.png",
              score: [0, 0, 0, 0, 0, 0, 0],
              shirt: "https://img.thesports.com/football/team/effa571bc3ca24dd7d1f2513bf849a52.png",
              isDefaultShirt: false,
              national: true,
            ),
            awayTeam: AwayTeam(id: "9ba3e511-02c2-4fc3-8262-8fac97e20cfd", apiId: "d23xmvkh1y9qg8n", name: "Qatar", shortName: "Qatar", logo: "https://img.thesports.com/football/team/a61d3f41d78a6df8bf3a367ed8e6f5a1.png", score: [0, 0, 0, 0, 0, 0, 0], shirt: "https://img.thesports.com/football/team/7303a103c93fea0445384d6ff3f3d1b9.png", isDefaultShirt: false, national: true),
            matchStatusId: 1,
            matchStatusDescription: "Not started",
            matchDay: "10/06/2025",
            matchTime: "10:00",
            kickOff: 0,
            mustDisplay: 0,
            published: 1,
          ),
          // Added 3 matches for brevity, but more can be added from the provided data
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: (matches.data?.length ?? 0) + 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: MatchTableExpandableItem(match: matches),
          );
        },
      ),
    );
  }
}
