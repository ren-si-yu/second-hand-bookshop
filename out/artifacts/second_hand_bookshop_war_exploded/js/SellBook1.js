function showImg(obj) {
    var files = obj.files
    // document.getElementById("imgContainer").innerHTML = getImgsByUrl(files)
    getImgsByFileReader(document.getElementById("imgContainer"), files)
}

// 使用window.URL.createObjectURL(file)读取file实例并显示图片
function getImgsByUrl(files) {
    var elements = ''
    for (var i = 0; i < files.length; i++) {
        var url = window.URL.createObjectURL(files[i])
        elements += "<img src='" + url + "' style='width:100px; height: 100px; vertical-align: middle; margin-right: 5px;' />"
    }
    return elements
}

// 使用FileReader读取file实例并显示图片
function getImgsByFileReader(el, files) {
    for (var i = 0; i < files.length; i++) {
        let img = document.createElement('img')
        img.setAttribute('style', 'width: 100px; height: 100px; vertical-align: middle; margin-right: 5px;')
        el.appendChild(img)
        var reader = new FileReader()
        reader.onload = function (e) {
            img.src = e.target.result
        }
        reader.readAsDataURL(files[i])
    }
}

function getCity() {


    var provincesobj = document.getElementById("province");
    var cityobj = document.getElementById("city");
    var index = provincesobj.selectedIndex;

    //alert(provincesobj[index].value+","+provincesobj[index].text);
    var value = provincesobj[index].value;

    var cityName = cityArr[value];
    //6.将下拉框清楚索引为0之后的，只保留第一个
    cityobj.length = 1;

    for (var i = 1; i < cityArr[value].length; i++) {
        cityobj.options[cityobj.options.length] = new Option(cityName[i], i);

    }

}


$(function () {
    $('#myModal').modal('hide')
});

$(function () {
    $('#myModal').on('hide.bs.modal', function () {
        alert('您还未进行登陆是否关闭？');
    })
});
