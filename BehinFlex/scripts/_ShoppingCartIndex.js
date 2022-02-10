var counts = [];
function GetTotals() {
    $.ajax({
        url: "/Home/GetTotals",
        type: "Get"
    }).done(function (result) {
        $('#OrderTotal').html(result.OrderTotal);
        $('#OrderGrandTotal').html(result.OrderGrandTotal);
        $('#OrderFinalPrice').html(result.OrderGrandTotal);
        console.log('GetTotals Executed');
    });
}

function RemoveProductRow(productId) {
    $.ajax({
        url: "/ShoppingCart/Remove",
        type: "Get",
        data: { 'id': productId }
    }).done(function (result) {
        if (result == "Success") {
            $('#row_' + productId).remove();
            console.log('Product Row removed with ID: ' + productId);
            GetTotals();
        }
    });
}
$(document).ready(function() {
    GetTotals();
});
//Every id that contains delete string Like this "delete_1","delete_2"
$('[id*="delete_"]').click(function() {
    var productId = $(this).data("productid");
    RemoveProductRow(productId);
});

$(function () {
    $(".count").on("input",
        function () {
            //counts = $(".count").map(function () { return Number($(this).val()); }).get();
            //localStorage.setItem("counts", JSON.stringify(counts));
            var currentInput = $(this);
            var productId = currentInput.data('productid');
            var productPrice = currentInput.data('productprice');
            var productDiscount = currentInput.data('productdiscount');
            var productCount = +$(this).val();
            if (productCount == 0) {
                RemoveProductRow(productId);
                return;
            }
            //if (productCount !== 0) 
            {
                var sum = productCount * productPrice;
                var sumWithDiscount = sum - ((sum * productDiscount) / 100);

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
                        //myFunction();
                    });

                    GetTotals();
                    reCalculateDiscountCode();
                }
            }
        });
});

function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}
function reCalculateDiscountCode() {
    $.ajax({
        url: recalculateDiscountCodeUrl,
        type: "GET",
        success: function (result) {
            if (result.Successful === true) {
                $("#FinalPrice").text(result.Value);
            } else {
                
            }
        }
    });
}

$("#ApplyDiscountCode").click(function () {
    $.ajax({
        url: applyDiscountCodeUrl,
        data: { DiscountCode: $("#DiscountCode").val() },
        type: "GET",
        success: function (result) {
            if (result.Successful === true) {
                swal({
                    //position: 'top-right',
                    type: result.MessageType,
                    text: result.MessageText,
                    showConfirmButton: true,
                    showCancelButton: false,
                    //timer: 2500,
                    confirmButtonText: 'تایید',
                    cancelButtonText: 'انصراف',
                    //confirmButtonColor: '#d33'
                }).then((value) => {
                    console.log("reloading page");
                    location.reload();
                });
                //location.reload();
            } else {
                swal({
                    //position: 'top-right',
                    type: result.MessageType,
                    text: result.MessageText,
                    showConfirmButton: true,
                    showCancelButton: false,
                    //timer: 2500,
                    confirmButtonText: 'تایید',
                    cancelButtonText: 'انصراف',
                    //confirmButtonColor: '#d33'
                });
            }
        }
    });
});