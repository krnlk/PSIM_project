# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_data = UserDatum.create(
    [
        {
            email: 'jerzy.socha@gmail.com',
            first_name: 'Jerzy',
            last_name: 'Socha',
            login: 'jeż',
            password: 'soch',
            user_datum_id: 1
        },
        {
            email: 'milena.szulc@gmail.com',
            first_name: 'Milena',
            last_name: 'Szulc',
            login: 'mile',
            password: 'szul',
            user_datum_id: 2
        },
        {
            email: 'malgorzata.baranska@gmail.com',
            first_name: 'Małgorzata',
            last_name: 'Barańska',
            login: 'mistrz',
            password: 'malgorzata',
            user_datum_id: 3
        },
        {
            email: 'jan.nowak@gmail.com',
            first_name: 'Jan',
            last_name: 'Nowak',
            login: 'naj',
            password: 'kawon',
            user_datum_id: 4
        },
        {
            email: 'adrianna.krajewska@gmail.com',
            first_name: 'Adrianna',
            last_name: 'Krajewska',
            login: 'adam',
            password: 'kraj',
            user_datum_id: 5
        },
        {
            email: 'wiktor.wrona@gmail.com',
            first_name: 'Wiktor',
            last_name: 'Wrona',
            login: 'wiki',
            password: 'ptak',
            user_datum_id: 6
        }
    ]
)

employees = Employee.create(
    [
        {
            user_datum_id: 1
        },
        {
            user_datum_id: 2
        },
        {
            user_datum_id: 3
        }
    ]
)

clients = Client.create(
    [
        {
            user_datum_id: 4,
            user_datum_id_id: 1
        },
        {
            user_datum_id: 5,
            user_datum_id_id: 2
        },
        {
            user_datum_id: 6,
            user_datum_id_id: 3
        }
    ]
)

tracks = Track.create(
    [
        {
            error: false
        },
        {
            error: false
        },
        {
            error: true
        }
    ]
)

malfuntions = Malfunction.create(
    [
        {
            comment: 'Awaria podajnika kul',
            date: 02/20/2022,
            time_from: 8:20,
            time_to: 15:30
        },
        {
            comment: 'Dziura w torze',
            date: 03/12/2022,
            time_from: 10:11,
            time_to: 20:20
        },
        {
            comment: 'Nie działający monitor',
            date: 05/01/2022,
            time_from: 8:00,
            time_to: 23:00
        }
    ]
)

shoes = Shoe.create(
    [
        {
            size: 45
        },
        {
            size: 41
        },
        {
            size: 43
        }
    ]
)

priceLists = PriceList.create(
    [
        {
            current: true,
            item_type: 'tor',
            price: 50,
            time_from: 8:00,
            time_to: 16:00,
            weekday: 'Poniedziałek'
        },
        {
            current: true,
            item_type: 'tor',
            price: 70,
            time_from: 16:00,
            time_to: 22:00,
            weekday: 'Sobota'
        },
        {
            current: false,
            item_type: 'buty',
            price: 20,
            time_from: 8:00,
            time_to: 22:00,
            weekday: 'Czwartek'
        },
        {
            current: true,
            item_type: 'buty',
            price: 15,
            time_from: 8:00,
            time_to: 22:00,
            weekday: 'Wtorek'
        },
        {
            current: false,
            item_type: 'tor',
            price: 30,
            time_from: 8:00,
            time_to: 22:00,
            weekday: 'Piątek'
        },
        {
            current: true,
            item_type: 'buty',
            price: 20,
            time_from: 16:00,
            time_to: 22:00,
            weekday: 'Środa'
        }
    ]
)

reservations = Reservation.create(
    [
        {
            date: 06/15/2022,
            time_from: 8:00,
            time_to: 10:00
        },
        {
            date: 01/01/2020,
            time_from: 0:00,
            time_to: 5:00
        },
        {
            date: 10/10/2022,
            time_from: 20:00,
            time_to: 22:00
        }
    ]
)