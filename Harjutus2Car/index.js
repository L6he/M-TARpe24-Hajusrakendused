const myJson = [
    {
        color: "Rose Red",
        tintedWindows: false,
        wheels: 4,
        roofCargo: null,
        entertainment: ["FM Radio", " MP3, MP4 and MKV player", " harman/kardon speakers"],
        accessories: ["satnav", " cruise control"]
    },
    {
        color: "Navy blue",
        tintedWindows: true,
        wheels: 4,
        roofCargo: "Thule",
        entertainment: ["FM Radio", " Apple CarPlay/Android Auto", " Bowers & Wilkins Premium Sound speakers"],
        accessories: ["self drive system", " luggage cover"]
    }
];

let dataHtml = `
<div id="json">
            <h1>Car properties</h1> `
            for (let i = 0; i < myJson.length; i++) {
                dataHtml += `
            <h2>Car ${i + 1}</h2>
            <p>Color: ${myJson[i].color}</p>
            <p>Tinted Windows: ${myJson[i].tintedWindows}</p>
            <p>Wheels: ${myJson[i].wheels}</p>
            <p>Roof cargo: ${myJson[i].roofCargo}</p>
            <p>Entertainment: ${myJson[i].entertainment}</p>
            <p>Accessories: ${myJson[i].accessories}</p>
                <br>
`
dataHtml += "</div>"

document.getElementById("app").innerHTML = dataHtml;
}; //parem oleks nt. ${myJson[1]["Tinted Windows"]} asemel nimetada jsonis ümber tintedWindows-iks et olla teistega konsistentne aga ma jätan nii, et ma saaksin näha kuidas tühikutega võtmeid välja kutsuda

/* 
document.getElementById("app").innerHTML = `
<div id="json">
<h1>Car properties</h1>
            <p>Property: ${myJson[0].property}</p>
            <p>Color: ${myJson[0].color}</p>
            <p>Tinted Windows: ${myJson[0]["Tinted Windows"]}</p>
            <p>Wheels: ${myJson[0].wheels}</p>
            <p>Roof cargo: ${myJson[0]["Roof cargo"]}</p>
            <p>Entertainment: ${myJson[0].entertainment}</p>
            <p>Accessories: ${myJson[0].accessories}</p>
                <br>
            <p>Property: ${myJson[1].property}</p>
            <p>Color: ${myJson[1].color}</p>
            <p>Tinted Windows: ${myJson[1]["Tinted Windows"]}</p>
            <p>Wheels: ${myJson[1].wheels}</p>
            <p>Roof cargo: ${myJson[1]["Roof cargo"]}</p>
            <p>Entertainment: ${myJson[1].entertainment}</p>
            <p>Accessories: ${myJson[1].accessories}</p> */