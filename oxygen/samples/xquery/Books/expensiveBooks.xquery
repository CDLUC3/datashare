(: You can activate the content completion by pressing the Ctrl+Space keys. :)

<result>
    {
        let $avg := avg(doc("books.xml")//book/price)
        return
        <average_price>{$avg}</average_price>
    }
    
    {
        let $books := doc("books.xml")
        let $avg := avg($books//book/price)
        
        for $b in $books//book
           where $b/price > $avg
           return
              <expensive_book>
                 {$b/title}
                 <current_price>
                     {$b/price/text()}
                 </current_price>
                 <price_difference>
                     {$b/price - $avg}
                 </price_difference>
              </expensive_book>
    }
</result>