#Residence.destroy_all
Administrator.destroy_all


Residence.find_or_create_by(nombre: "Albar Club de Mar", descripcion: "El complejo Building Albar tiene dos espacios diferentes: un área gastronómica abierta a todo el público y un área de recreación privada con piscinas, decks y solárium. Tiene cocheras con portón automatizado con comando a distancia. Ademas cuentan con sauna, hidromasaje, piscina climatizada, área de fitness y vestuarios con acceso independiente. El complejo brinda todo en cuanto a tecnología, confort, seguridad y un diseño moderno en armonía con el entorno.", urlImag: "https://www.rci.com/static/Resorts/Assets/D448E01L.jpg",precio:20000, pais: "Argentina", provincia: "Buenos Aires", localidad: "Pinamar", direccion: "Av. Jorge Bunge, entre Jason y Av. Intermédanos, #D448.")
Residence.find_or_create_by(nombre: "Aldea Andina", descripcion: "Los servicios de Aldea Andina incluyen Wi-Fi en todo el recinto, zonas comunes y privadas, piscina climatizada interior y exterior, servicios de SPA, cancha de tenis, un quincho para asados, un fogón, lugar de juegos de mesa y un parque de juegos para los niños en el fabuloso parque de cuatro acres rodeado de una gran variedad de árboles.", urlImag: "https://www.rci.com/static/Resorts/Assets/1940E02L.jpg",precio: 18000, pais: "Argentina", provincia: "Río Negro", localidad: "San Carlos de Bariloche", direccion: "Av. Pioneros, #1949")
Residence.find_or_create_by(nombre: "Club Cariló Playa", descripcion: "El complejo cuenta con un clubhouse, una sala para leer, un solarium, piscina exterior y cubierta, gimnasio, sauna, acceso directo a la playa y WI-FI. El condominio está formado por 4 edificios con departamentos de 1, 2 y 3 ambientes totalmente equipados con parrillas y balcones individuales. Dichos departamentos tienen una capacidad de 2 a 7 personas, con vista al mar y al bosque. Desarrollados en un amplio parque con salida exclusiva a la playa", urlImag: "https://www.rci.com/static/Resorts/Assets/2909E01L.jpg",precio:20000 , pais: "Argentina", provincia: "Buenos Aires", localidad: "Cariló", direccion: "Av. Avutarda, #2909")
Residence.find_or_create_by(nombre: "Howard Johnson la Canada & Suites", descripcion: " Este centro cultural y comercial se encuentra en las estribaciones de las montañas de Sierra Chica en el río Suquia. Es una ciudad moderna, a pesar de sus muchos edificios que datan de la época colonial. Córdoba combina la actividad urbana e industrial con la relajación. Situado junto a las sierras y lagos, es ideal para turistas que buscan tranquilidad y belleza en el entorno. Los valles de Córdoba invitan a ser explorados. Su ubicación también ofrece una zona ideal para practicar deportes de aventura", urlImag: "https://www.rci.com/static/Resorts/Assets/C528E01L.jpg",precio: 400000, pais: "Argentina", provincia: "Córdoba", localidad: "CBA", direccion: "Av. Figueroa Alcorta y Colon, #C528")
Residence.find_or_create_by(nombre: "Le Mirage Village Club", descripcion: "Está situado en la colina con vistas a las Sierras Chicas. A sólo 5 minutos de la villa y a 25 de la ciudad de Córdoba, tiene 36 apartamentos (para 2, 3, 4, 5, 6 y 7 personas). El centro vacacional cuenta con un restaurante y confitería, servicio de habitaciones, parrilleras de usos múltiples, piscinas climatizadas al aire libre, servicio de limpieza y cambio de ropa, vigilancia nocturna, hidromasaje para grupos de hasta 4 personas y actividades recreativas programadas", urlImag: "https://www.rci.com/static/Resorts/Assets/6482E01L.jpg",precio:32000 , pais: "Argentina", provincia: "Córdoba", localidad: "Villa Carlos Paz", direccion: "Directorio, #6482 ")
Administrator.find_or_create_by(nombre: "Cuenta", apellido: "Maestra", nomUsuario: "admin", password: "admin")





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

