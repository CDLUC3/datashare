(: You can activate the content completion by pressing the Ctrl+Space keys. :)

<author_list>
    {
        let $library := doc("books.xml")
        let $seq := $library//author
        let $distinct := distinct-values($seq)
        
        for $a in $distinct
           return
              <author>
                 <name> {$a} </name>
                 {
                     for $book in $library/library/publisher/book
                     where (compare($book/author, $a) eq 0)
                     return $book/title
                 }
              </author> 
    }
</author_list>


