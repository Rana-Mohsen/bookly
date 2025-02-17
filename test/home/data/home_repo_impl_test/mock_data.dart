const mockBestSellerApiResponse = {
        "kind": "books#volumes",
        "totalItems": 772,
        "items": [
          {
            "kind": "books#volume",
            "id": "7G95xo-6JjQC",
            "etag": "LRb4+pxu7Sg",
            "selfLink":
                "https://www.googleapis.com/books/v1/volumes/7G95xo-6JjQC",
            "volumeInfo": {
              "title": "Introduction to Computer Science",
              "authors": ["I. T. L. Education Solutions Limited", "Itl Esl"],
              "publisher": "Pearson Education India",
              "publishedDate": "2004-09",
              "industryIdentifiers": [
                {"type": "ISBN_10", "identifier": "813170436X"},
                {"type": "ISBN_13", "identifier": "9788131704363"}
              ],
              "readingModes": {"text": false, "image": true},
              "pageCount": 512,
              "printType": "BOOK",
              "categories": ["Computers"],
              "averageRating": 4,
              "ratingsCount": 4,
              "maturityRating": "NOT_MATURE",
              "allowAnonLogging": false,
              "contentVersion": "0.2.4.0.preview.1",
              "panelizationSummary": {
                "containsEpubBubbles": false,
                "containsImageBubbles": false
              },
              "imageLinks": {
                "smallThumbnail":
                    "http://books.google.com/books/content?id=7G95xo-6JjQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
                "thumbnail":
                    "http://books.google.com/books/content?id=7G95xo-6JjQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
              },
              "language": "en",
              "previewLink":
                  "http://books.google.com.eg/books?id=7G95xo-6JjQC&printsec=frontcover&dq=computer+science&hl=&cd=1&source=gbs_api",
              "infoLink":
                  "http://books.google.com.eg/books?id=7G95xo-6JjQC&dq=computer+science&hl=&source=gbs_api",
              "canonicalVolumeLink":
                  "https://books.google.com/books/about/Introduction_to_Computer_Science.html?hl=&id=7G95xo-6JjQC"
            },
            "saleInfo": {
              "country": "EG",
              "saleability": "NOT_FOR_SALE",
              "isEbook": false
            },
            "accessInfo": {
              "country": "EG",
              "viewability": "PARTIAL",
              "embeddable": true,
              "publicDomain": false,
              "textToSpeechPermission": "ALLOWED",
              "epub": {"isAvailable": false},
              "pdf": {
                "isAvailable": true,
                "acsTokenLink":
                    "http://books.google.com.eg/books/download/Introduction_to_Computer_Science-sample-pdf.acsm?id=7G95xo-6JjQC&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
              },
              "webReaderLink":
                  "http://play.google.com/books/reader?id=7G95xo-6JjQC&hl=&source=gbs_api",
              "accessViewStatus": "SAMPLE",
              "quoteSharingAllowed": false
            }
          },
        ]
      };