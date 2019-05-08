init() 
{
   llSetClickAction (CLICK_ACTION_TOUCH);
}

default
{
    state_entry()
    {
        init(); 
    }
   
    on_rez(integer start_param)
    {
        init(); 
    }
   
    changed(integer change)
    {
        if (change & (CHANGED_OWNER | CHANGED_INVENTORY)) // if owner or inventory changes
        init(); 
    }
   
    touch_start(integer total_number)
    {
        key id = llDetectedKey(0);

        integer sameGroup = llSameGroup(id);
        // same as llDetectedGroup(i) (with llDetectedGroup, detected does not need to be in the sim)

        if (sameGroup)
        {
            /* integer numberOfObjectsInPrim = llGetInventoryNumber(INVENTORY_OBJECT);

            if (numberOfObjectsInPrim)
                llGiveInventory(id, llGetInventoryName(INVENTORY_OBJECT, 0));
            */   
            
			      llSetPrimitiveParams([PRIM_GLOW, ALL_SIDES, 0.10]);

            // Success Message
			      llRegionSayTo(id, 0, "Group confirmed! Deleting...");

            //llRegionSayTo(llDetectedKey(0),PUBLIC_CHANNEL,message);            
            llDie();
        }
        else
        {
            llSetPrimitiveParams([PRIM_GLOW, ALL_SIDES, 0.10]);
			      llRegionSayTo(id, 0, "Please wear the correct group tag to delete this!");
			      llGiveInventory(llDetectedKey(0),llGetInventoryName(INVENTORY_NOTECARD, 0));
			      llSetPrimitiveParams([PRIM_GLOW, ALL_SIDES, 0.00]);
        }
    }    
}

// MIT LICENCE
// Copyright 2014 MJ Dunn <mjdunnonline@gmail.com>
