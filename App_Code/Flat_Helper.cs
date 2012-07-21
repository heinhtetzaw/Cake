using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Flat_Helper
/// </summary>
public static class Flat_Helper
{
    static FlatDataContext flatDataContext = new FlatDataContext();

    public static filtered_site_status Get_Site_Status()
    {
        return (from c in flatDataContext.filtered_site_status select c).FirstOrDefault();
    }

    public static filtered_flat_room Get_Flat_Room(string room_id)
    {
        filtered_flat_room _flat_room = (from c in flatDataContext.filtered_flat_rooms where c.room_id == room_id select c).FirstOrDefault();
        return _flat_room;
    }

    public static filtered_flat_room Get_Flat_Room(string email, string contact_no)
    {
        filtered_flat_room _flat_room = (from c in flatDataContext.filtered_flat_rooms where c.email == email && c.contact_no == contact_no select c).FirstOrDefault();
        return _flat_room;
    }

    public static Boolean Update_View_Count(string room_id)
    {
        flat_room found_room = (from c in flatDataContext.flat_rooms where c.room_id == room_id select c).FirstOrDefault();
        if (found_room != null)
        {
            found_room.view_count = ++found_room.view_count;
            flatDataContext.SubmitChanges();
            return true;
        }
        return false;
    }

    public static Boolean Update_Flat_Room(flat_room _flat_room)
    {
        flat_room found_room = (from c in flatDataContext.flat_rooms where c.contact_no == _flat_room.contact_no && c.email == _flat_room.email select c).FirstOrDefault();
        if (found_room != null)
        {
            found_room.description = _flat_room.description;
            found_room.title = _flat_room.title;
            found_room.price = _flat_room.price;
            found_room.available = _flat_room.available;
            found_room.postal_code = _flat_room.postal_code;
            found_room.remarks = _flat_room.remarks;
            found_room.available_type = _flat_room.available_type;
            found_room.available_count = _flat_room.available_count;
            found_room.mrt1_id = _flat_room.mrt1_id;
            found_room.mrt2_id = _flat_room.mrt2_id;
            found_room.mrt3_id = _flat_room.mrt3_id;
            found_room.post_on = DateTime.Now;
            // Post Count
            Int32 post_count = 0;
            Int32.TryParse(found_room.post_count.ToString(), out post_count);
            found_room.post_count = ++post_count;

        }
        else
        {

            _flat_room.room_id = Guid.NewGuid().ToString();

            _flat_room.room_id = Guid.NewGuid().ToString();

            _flat_room.post_on = DateTime.Now;
            _flat_room.post_count = 1;
            _flat_room.view_count = 1;
            flatDataContext.flat_rooms.InsertOnSubmit(_flat_room);

        }
        flatDataContext.SubmitChanges();
        return true;
    }

    public static List<filtered_flat_mrt> Get_MRT_List()
    {
        List<filtered_flat_mrt> _mrts = (from c in flatDataContext.filtered_flat_mrts
                                         select c).ToList();
        return _mrts.OrderBy(c => c.seq_no).ToList();
    }


    public static List<filtered_flat_room> Get_Flat_Room_List()
    {
        List<filtered_flat_room> _flat_rooms = (from c in flatDataContext.filtered_flat_rooms
                                                select c).ToList();
        return _flat_rooms.OrderByDescending(c => c.post_on).ToList();
    }
    public static List<filtered_flat_room> Get_Flat_Room_List(string mrt_id, string available_type)
    {
        List<filtered_flat_room> _flat_rooms =
            (from c in flatDataContext.filtered_flat_rooms
             where
                 ((mrt_id == "all") || (mrt_id != "all" && (c.mrt1_id == mrt_id || c.mrt2_id == mrt_id || c.mrt3_id == mrt_id))) &&
                 ((available_type == "all") || (available_type != "all" && c.available_type == available_type))
             select c).ToList();
        return _flat_rooms.OrderByDescending(c => c.post_on).ToList();
    }


}