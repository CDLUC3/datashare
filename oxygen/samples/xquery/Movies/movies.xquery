(: You can activate the content completion by pressing the Ctrl+Space keys. :)

let $review := doc("reviews.xml")
for $movie in doc("movies.xml")/movies/movie
let $movie-id := $movie/@id
let $avgRating := avg($review/reviews/review[@movie-id = $movie-id]/rating)
let $maxRating := max($review/reviews/review[@movie-id = $movie-id]/rating)
let $minRating := min($review/reviews/review[@movie-id = $movie-id]/rating)
return
 <movie id="{$movie/@id}">
  {$movie/title}
  {$movie/year}
 <avgRating>
      {  
         if ($avgRating) then $avgRating else "not rated"
      }
 </avgRating>
  <maxRating>
      <value>
        {
            if ($maxRating) then $maxRating else "not rated"
        }
      </value>
      {
          for $rev in $review/reviews/review
          where ((compare($rev/rating/text(), string($maxRating)) eq 0) 
                  and ($rev/@movie-id = $movie/@id))
          return $rev/author
      }
  </maxRating>
  <minRating>
      <value>
        {
            if ($minRating) then $minRating else "not rated"
        }
      </value>
      {
          for $rev in $review/reviews/review
          where ((compare($rev/rating/text(), string($minRating)) eq 0) 
                  and ($rev/@movie-id = $movie/@id))
          return $rev/author
      }
  </minRating>
 </movie>
