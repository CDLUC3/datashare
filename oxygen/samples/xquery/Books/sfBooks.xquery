(: You can activate the content completion by pressing the Ctrl+Space keys. :)

<SFBooks>
    {
        for $book in doc("books.xml")//book
        return
              if (contains($book/author/text(),"Herbert") or contains($book/author/text(),"Asimov"))
              then $book
              else $book/text()
    }
</SFBooks>