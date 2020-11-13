window.addEventListener('load', () => {


//価格入力欄のidを手がかりに変数にconstで代入する
  const priceInput = document.getElementById("item-price");
 
//価格のフォームに入力したあとにイベントを発火
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;


//手数料
  const addTaxDom = document.getElementById("add-tax-price");
  const Tax = inputValue * 0.1
        addTaxDom.innerHTML = Math.floor(Tax)

//利益計算   
  const saleFee  = document.getElementById("profit");
        saleFee.innerHTML = Math.floor(inputValue - Tax)
})

});

