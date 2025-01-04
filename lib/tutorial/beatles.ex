defmodule Tutorial.Beatles do
  alias Tutorial.Beatles.Album
  alias Tutorial.Beatles.Beatle

  def list_beatles do
    [
      %Beatle{
        id: 1,
        name: "John Lennon",
        instrument: "Vocals, guitar",
        dob: ~D[1940-09-10],
        photo: "john.jpg"
      },
      %Beatle{
        id: 2,
        name: "Paul McCartney",
        instrument: "Vocals, bass",
        dob: ~D[1942-06-18],
        photo: "paul.jpg"
      },
      %Beatle{
        id: 3,
        name: "George Harrison",
        instrument: "Lead guitar",
        dob: ~D[1943-02-25],
        photo: "george.jpg"
      },
      %Beatle{
        id: 4,
        name: "Ringo Starr",
        instrument: "Drums",
        dob: ~D[1940-07-07],
        photo: "ringo.jpg"
      }
    ]
  end

  def list_albums do
    [
      %Album{
        id: 1,
        name: "Please Please Me",
        released: ~D[1963-03-22],
        duration: 32,
        label: "Parlophone",
        number_of_tracks: 14,
        cover: "Please_Please_Me.png"
      },
      %Album{
        id: 2,
        name: "With The Beatles",
        released: ~D[1963-11-22],
        duration: 33,
        label: "Parlophone",
        number_of_tracks: 14,
        cover: "With_the_Beatles.png"
      },
      %Album{
        id: 3,
        name: "A Hard Day's Night",
        released: ~D[1964-07-10],
        duration: 30,
        label: "Parlophone",
        number_of_tracks: 13,
        cover: "HardDaysNight.jpg"
      },
      %Album{
        id: 4,
        name: "Beatles for Sale",
        released: ~D[1964-12-04],
        duration: 34,
        label: "Parlophone",
        number_of_tracks: 14,
        cover: "Beatlesforsale.jpg"
      },
      %Album{
        id: 5,
        name: "Help!",
        released: ~D[1965-08-06],
        duration: 33,
        label: "Parlophone",
        number_of_tracks: 14,
        cover: "Help.png"
      },
      %Album{
        id: 6,
        name: "Rubber Soul",
        released: ~D[1965-12-03],
        duration: 35,
        label: "Parlophone",
        number_of_tracks: 14,
        cover: "Rubber_Soul.png"
      },
      %Album{
        id: 7,
        name: "Revolver",
        released: ~D[1966-08-05],
        duration: 35,
        label: "Parlophone",
        number_of_tracks: 14,
        cover: "Revolver.jpg"
      },
      %Album{
        id: 8,
        name: "Sgt. Pepper's Lonely Hearts Club Band",
        released: ~D[1967-05-26],
        duration: 40,
        label: "Parlophone",
        number_of_tracks: 13,
        cover: "Sgt._Pepper's_Lonely_Hearts_Club_Band.jpg"
      },
      %Album{
        id: 9,
        name: "The Beatles (White Album)",
        released: ~D[1968-11-22],
        duration: 93,
        label: "Apple",
        number_of_tracks: 30,
        cover: "WhiteAlbum.jpg"
      },
      %Album{
        id: 10,
        name: "Yellow Submarine",
        released: ~D[1969-01-13],
        duration: 40,
        label: "Apple",
        number_of_tracks: 13,
        cover: "YellowSubmarine.jpg"
      },
      %Album{
        id: 11,
        name: "Abbey Road",
        released: ~D[1969-09-26],
        duration: 47,
        label: "Apple",
        number_of_tracks: 17,
        cover: "abbeyroad.jpg"
      },
      %Album{
        id: 12,
        name: "Let It Be",
        released: ~D[1970-05-08],
        duration: 35,
        label: "Apple",
        number_of_tracks: 12,
        cover: "LetItBe.png"
      }
    ]
  end
end
