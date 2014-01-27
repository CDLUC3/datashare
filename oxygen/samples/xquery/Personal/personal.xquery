(: You can activate the content completion by pressing the Ctrl+Space keys. :)

<BigBoss_subordinates>
    {
        for $person in doc("personal.xml")/personnel/person
        let $link := $person/link
        where (exists($link/@manager) and (compare($link/@manager, "Big.Boss") eq 0)) 
        return
            <person id="{$person/@id}">
                <name>{$person/name/given/text(), " ", $person/name/family/text()}</name>
            </person>
    }
</BigBoss_subordinates>
