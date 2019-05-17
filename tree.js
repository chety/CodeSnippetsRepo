function organizeTree(data, code, parentCode) {
    const codes = data.map(item => item[code]);
    const topRoot = data.find(item => !codes.includes(item[parentCode]))
    topRoot["children"] = [];
    const dataWithOutRoot = data.filter(item => item[code] !== topRoot[code]).map(item => {
        item["children"] = [];
        return item;
    })
    return dataWithOutRoot.reduce((result, item) => {
        const itemParent = dataWithOutRoot.find(e => e[code] === item[parentCode]);
        if (itemParent) {
            itemParent["children"].push(item);
        } else {
            topRoot["children"].push(item);
        }
        return topRoot;
    }, topRoot);

}


console.log(
    organizeTree([
        {
            "Kod": 1,
            "UstKod": 0,
            "Deger": 128.5,
            "Ad": "TOPLAM",
            "Sira": "1"
},
        {
            "Kod": 2,
            "UstKod": 1,
            "Deger": 68.75,
            "Ad": "TAHSİL VE TEDİYE",
            "Sira": "0"
},
        {
            "Kod": 3,
            "UstKod": 2,
            "Deger": 69,
            "Ad": "Amokachi",
            "Sira": "5"
},
,
        {
            "Kod": 4,
            "UstKod": 2,
            "Deger": 13,
            "Ad": "Bedlisi",
            "Sira": "1"
},
        {
            "Kod": 5,
            "UstKod": 4,
            "Deger": 14,
            "Ad": "Tatvani",
            "Sira": "9"
}], "Kod", "UstKod"));
