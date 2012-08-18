using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Quote_Helper
/// </summary>
public static class Quote_Helper
{
   
    static QuoteDataContext _quoteDataContext = new QuoteDataContext();
    public static IQueryable<filtered_quote_post> Get_Quote_Post_List(Int32 page_index, Int32 row_per_page)
    {
        IQueryable<filtered_quote_post> _quote_posts =
            (from c in _quoteDataContext.filtered_quote_posts
             select c);
        if (row_per_page == 0)
            return _quote_posts.OrderByDescending(c => c.post_on)
                .Skip(row_per_page * page_index)
                .Take(row_per_page);
        else
            return _quote_posts.OrderByDescending(c => c.post_on);
    }
	
}