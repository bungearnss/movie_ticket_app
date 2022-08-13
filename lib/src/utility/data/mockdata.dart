import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant/constants.dart';
import '../../models/movies.dart';

final section1 = List.generate(
  16,
  (index) => Seat(
    isHidden: [0, 1, 4].contains(index),
    isOcuppied: [].contains(index),
  ),
);

final section2 = List.generate(
  16,
  (index) => Seat(
    isHidden: [4, 5, 6, 7].contains(index),
    isOcuppied: [12, 13].contains(index),
  ),
);

final section3 = List.generate(
  16,
  (index) => Seat(
    isHidden: [2, 3, 7].contains(index),
    isOcuppied: [13, 14, 15].contains(index),
  ),
);

final section4 = List.generate(
  20,
  (index) => Seat(
    isHidden: [].contains(index),
    isOcuppied: [1, 2, 3].contains(index),
  ),
);

final section5 = List.generate(
  20,
  (index) => Seat(
    isHidden: [].contains(index),
    isOcuppied: [].contains(index),
  ),
);

final section6 = List.generate(
  20,
  (index) => Seat(
    isHidden: [].contains(index),
    isOcuppied: [14].contains(index),
  ),
);

final seats = [
  section1,
  section2,
  section3,
  section4,
  section5,
  section6,
];

final seatTypes = [
  SeatType(name: 'Available', color: Colors.grey),
  SeatType(name: 'Booked', color: Colors.black),
  SeatType(name: 'Selection', color: AppColors.primaryColor),
];

final dates = [
  MovieDate(
      day: DateTime.now().day,
      month: DateFormat('MMM').format(DateTime.now()),
      hour: "6:00 PM"),
  MovieDate(
      day: DateTime.now().day,
      month: DateFormat('MMM').format(DateTime.now()),
      hour: "8:00 PM"),
  MovieDate(
      day: DateTime.now().day,
      month: DateFormat('MMM').format(DateTime.now()),
      hour: "9:00 PM"),
  MovieDate(
      day: DateTime.now().day,
      month: DateFormat('MMM').format(DateTime.now()),
      hour: "10:00 PM"),
];
final movies = [
  Movies(
    name: 'Avatar',
    img:
        "https://www.themoviedb.org/t/p/original/8Y7WrRK1iQHEX7UIftBeBMjPjWD.jpg",
    screenPreview:
        "https://www.themoviedb.org/t/p/original/8Y7WrRK1iQHEX7UIftBeBMjPjWD.jpg",
    description:
        "AVATAR takes us to a spectacular world beyond imagination, where a reluctant hero embarks on an epic adventure, ultimately fighting to save the alien world he has learned to call home. James Cameron, the Oscar-winning director of Titanic, first conceived the film 15 years ago, when the means to realize his vision did not exist yet. Now, after four years of production, AVATAR, a live action film with a new generation of special effects, delivers a fully immersive cinematic experience of a new kind, where the revolutionary technology invented to make the film disappears into the emotion of the characters and the sweep of the story.",
    type: ["Fantasy"],
    hours: 2.45,
    director: "James Cameron",
    stars: 5,
    actors: [
      "Sam Worthington",
      "Zoe Saldana",
      "Sigourney Weaver",
      "Michelle Rodriguez",
      "Stephen Lang"
    ],
    dates: dates,
    seats: seats,
  ),
  Movies(
    name: 'Fantastic Beasts: The Secrets of Dumbledore',
    img:
        "https://pbs.twimg.com/media/FMsKCLpVEAA7Y81?format=jpg&name=4096x4096",
    screenPreview:
        "https://pbs.twimg.com/media/FMsKCLpVEAA7Y81?format=jpg&name=4096x4096",
    description:
        "Professor Albus Dumbledore knows the powerful Dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts Magizoologist Newt Scamander to lead an intrepid team of wizards, witches and one brave Muggle baker on a dangerous mission, where they encounter old and new beasts and clash with Grindelwald's growing legion of followers. But with the stakes so high, how long can Dumbledore remain on the sidelines?",
    type: ["Fantasy", "Action", "Adventure"],
    hours: 2.22,
    director: "David Yates",
    stars: 5,
    actors: [
      "Eddie Redmayne",
      "Jude Law",
      "Ezra Miller",
      "Dan Fogler",
      "Stephen Lang"
    ],
    dates: dates,
    seats: seats,
  ),
  Movies(
    name: 'Begin Again',
    img:
        "https://m.media-amazon.com/images/M/MV5BNjAxMTI4MTgzMV5BMl5BanBnXkFtZTgwOTAwODEwMjE@._V1_.jpg",
    screenPreview:
        "https://m.media-amazon.com/images/M/MV5BNjAxMTI4MTgzMV5BMl5BanBnXkFtZTgwOTAwODEwMjE@._V1_.jpg",
    description:
        "Gretta (Keira Knightley) and her long-time boyfriend Dave (Adam Levine) are college sweethearts and songwriting partners who decamp for New York when he lands a deal with a major label. But the trappings of his new-found fame soon tempt Dave to stray, and a reeling, lovelorn Gretta is left on her own. Her world takes a turn for the better when Dan (Mark Ruffalo), a disgraced record-label exec, stumbles upon her performing on an East Village stage and is immediately captivated by her raw talent. From this chance encounter emerges an enchanting portrait of a mutually transformative collaboration, set to the soundtrack of a summer in New York City.",
    type: ["Comedy", "Drama", "Music", "Romance"],
    hours: 1.44,
    director: "John Carney",
    stars: 4,
    actors: [
      "Keira Knightley",
      "Mark Ruffalo",
      "Adam Levine",
      "Hailee Steinfeld",
      "James Corden"
    ],
    dates: dates,
    seats: seats,
  ),
];
