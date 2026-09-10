const myJson = [
    {
       Car: {
        "Property": "Car 0",
        "Color": "Rose Red",
        "Tinted Windows": false,
        "Wheels": 4,
        "Roof cargo": null,
        "Entertainment": ["FM Radio", " MP3, MP4 and MKV player", " harman/kardon speakers"],
        "Accessories": ["satnav", " cruise control"]
        }
    },
    {
    Car: {
        "Property": "Car1",
        "Color": "Navy blue",
        "Tinted Windows": true,
        "Wheels": 4,
        "Roof cargo": "Thule",
        "Entertainment": ["FM Radio", " Apple CarPlay/Android Auto", " Bowers & Wilkins Premium Sound speakers"],
        "Accessories": ["self drive system", " luggage cover"]
        } 
    }
];

document.getElementById("app").innerHTML = `
<div id="json">
            <h1>Car properties</h1>
            <p>Property: ${myJson[0].Car.Property}</p>
            <p>Color: ${myJson[0].Car.Color}</p>
            <p>Tinted Windows: ${myJson[0].Car["Tinted Windows"]}</p>
            <p>Wheels: ${myJson[0].Car.Wheels}</p>
            <p>Roof cargo: ${myJson[0].Car["Roof cargo"]}</p>
            <p>Entertainment: ${myJson[0].Car.Entertainment}</p>
            <p>Accessories: ${myJson[0].Car.Accessories}</p>
                <br>
            <p>Property: ${myJson[1].Car.Property}</p>
            <p>Color: ${myJson[1].Car.Color}</p>
            <p>Tinted Windows: ${myJson[1].Car["Tinted Windows"]}</p>
            <p>Wheels: ${myJson[1].Car.Wheels}</p>
            <p>Roof cargo: ${myJson[1].Car["Roof cargo"]}</p>
            <p>Entertainment: ${myJson[1].Car.Entertainment}</p>
            <p>Accessories: ${myJson[1].Car.Accessories}</p>
</div>
`;