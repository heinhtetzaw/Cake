using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for News_Helper
/// </summary>
public static class News_Helper
{
    static NewsDataContext newsDataContext = new NewsDataContext();
    public static string Create_News_Post(news_post _news_post)
    {
        try
        {
            _news_post.news_id = Guid.NewGuid().ToString();
            _news_post.post_on = DateTime.Now;
            newsDataContext.news_posts.InsertOnSubmit(_news_post);
            newsDataContext.SubmitChanges();
            return _news_post.news_id;
        }
        catch (Exception ex)
        {
            return string.Format("Fail : {0}",ex.Message);
        }
    }
    public static List<news_source> Get_Resource_List()
    {
        List<news_source> _sources = (from c in newsDataContext.news_sources
                                         orderby c.source_name
                                         select c).ToList();
        return _sources;
    }
    public static List<news_type> Get_News_Type_List()
    {
        List<news_type> _type = (from c in newsDataContext.news_types
                                      orderby c.news_type_description
                                      select c).ToList();
        return _type;
    }

    #region Get News Post List
    public static IQueryable<filtered_news_post> Get_News_Post_List_By_News_Source(string search_news_source, Int32 page_index, Int32 row_per_page)
    {
        return Get_News_Post_List(search_news_source, "", page_index, row_per_page);
    }

    public static IQueryable<filtered_news_post> Get_News_Post_List_By_News_Type(string search_news_type, Int32 page_index, Int32 row_per_page)
    {
        return Get_News_Post_List("", search_news_type, page_index, row_per_page);
    }

    public static IQueryable<filtered_news_post> Get_News_Post_List(string search_source, string search_news_type, Int32 page_index, Int32 row_per_page)
    {
        IQueryable<filtered_news_post> _news_posts = (from c in newsDataContext.filtered_news_posts
                                                      select c);
        if (search_news_type != "")
            _news_posts = (from c in _news_posts where c.news_type_id == search_news_type select c);
        if (search_source != "")
            _news_posts = (from c in _news_posts where c.news_source_id == search_source select c);

        if (row_per_page == 0)
            return _news_posts.OrderByDescending(c => c.post_on)
                .Skip(row_per_page * page_index)
                .Take(row_per_page);
        else
            return _news_posts.OrderByDescending(c => c.post_on);
    }
    #endregion
    
}