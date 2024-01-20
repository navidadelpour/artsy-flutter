// ignore_for_file: non_constant_identifier_names

import 'package:artsy_app/graphql/models.dart';

const Artist artistMock = Artist(
  id: "andy-warhol",
  name: "Andy Warhol",
  nationality: "American",
  birthday: "1928",
  location: "New York, United States",
  image: Image_(
    url:
        'https://d32dm0rphc51dk.cloudfront.net/E-k-uLoQADM8AjadsSKHrA/tall.jpg',
  ),
);

const Artwork artworkMock = Artwork(
  id: '5436c9967261690809c80200',
  title: 'Marilyn',
  category: 'Print',
  price: '23\$',
  image: Image_(
    url:
        'https://d32dm0rphc51dk.cloudfront.net/iAUTdeZjDShoGHdYKkQvIg/tall.jpg',
  ),
);

const Show showMock = Show(
  name: 'Leeum Collection: Beyond Space',
  city: 'Seoul ',
  status: 'running',
  exhibition_period: 'Aug 19, 2014 – Dec 31, 2999',
  cover_image: Image_(
    url:
        "https://d32dm0rphc51dk.cloudfront.net/vlXf0LFyHT9wTe7ODTMuJg/larger.jpg",
  ),
);
