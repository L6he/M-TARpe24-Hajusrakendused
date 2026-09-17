document.getElementById("app").innerHTML = `<table id="xmlTable"></table>`;

const xmlhttp = new XMLHttpRequest();
xmlhttp.open("GET", "games.xml", false);
xmlhttp.send();
const xmlContent = xmlhttp.responseXML;
console.log("xmlContent", xmlContent);

function generateTable(xmlContent) {
    let tableRows = "<tr><th>Title</th><th>Price</th><th>Platforms</th></tr>";
    let gameElements = xmlContent.getElementsByTagName("game");
    console.log("gameElements", gameElements);

    for (let i = 0; i < gameElements.length; i++) {
        const element = gameElements[i];
        const title = element.getElementsByTagName("title")[0].textContent;
        const price = element.getElementsByTagName("price")[0].textContent;
        const platforms = element.getElementsByTagName("platforms")[0].textContent;
        tableRows += 
        `<tr><td>${title}</td><td>${price}</td><td>${platforms}</td></tr>`;
    }
    document.getElementById("xmlTable").innerHTML = tableRows;
}

generateTable(xmlContent);