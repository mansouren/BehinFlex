//$(document).ready(function () {
//var counts = [];
$(document).ready(function () {
    GetTotals();
});
function GetTotals() {
    $.ajax({
        url: "/Home/GetTotals",
        type: "Get"
    }).done(function (result) {
        $('#OrderTotal').html(result.OrderTotal);
        $('#OrderGrandTotal').html(result.OrderGrandTotal);
        console.log('GetTotals Executed');
    });
}


$(document).ready
(function () {
    $(".count").on("input",
        function () {
            //counts = $(".count").map(function () { return Number($(this).val()); }).get();
            //localStorage.setItem("counts", JSON.stringify(counts));
            var currentInput = $(this);
            var productId = currentInput.data('productid');
            var productPrice = currentInput.data('productprice');
            var productDiscount = currentInput.data('productdiscount');
            var productCount = +$(this).val();
            //if (productCount !== 0) 
            {
                var sum = productCount * productPrice;
                var sumWithDiscount = sum - ((sum * productDiscount) / 100);
                //The console is useful for testing purposes
                console.log("Input ID: " + $(currentInput).attr('id'));
                console.log("Product Count: " + productCount);
                console.log("Product ID: " + productId);
                console.log("Product Price: " + productPrice);
                console.log("Product Discount: " + productDiscount);
                console.log("Sum: " + sum);
                console.log("Sum with Discount: " + sumWithDiscount);
                console.log("=====================================");

                $("#sum_" + productId).text(sum);
                $("#sum_with_discount_" + productId).text(sumWithDiscount);

                if (productPrice !== 0) {
                    $.ajax({
                        url: "/Api/Shop",
                        type: "Get",
                        data: { ProductID: productId, productCount: productCount }
                    }).done(function (result) {
                        $('#CountShopCart').html(result);
                        myFunction();
                    });

                    $.ajax({
                        url: "/Home/GetTotals",
                        type: "Get"
                    }).done(function (result) {
                        $('#OrderTotal').html(result.OrderTotal);
                        $('#OrderGrandTotal').html(result.OrderGrandTotal);
                        console.log('GetTotals Executed');
                    });
                }
            }
        });
});

function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}
function myFunction() {
    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
}
/*
$(function () {
    counts = localStorage.getItem("counts");
    if (counts) counts = JSON.parse(counts);
    $(".count").each(function (i) {
        $(this).val(counts[i]);
    }).trigger("input");

});*/

//});