(: You can activate the content completion by pressing the Ctrl+Space keys. :)

<sales>
   {
       for $product in 
          doc("products.xml")/products/product,
            $sale in doc("sales.xml")/sales/sale        
       where $product/productId = $sale/@productId
       return <product id="{$product/productId}">
             {$product/productName, $product/productSpec,
               $sale/mrq, $sale/ytd, $sale/margin}           
                  </product>              
   }
</sales>
