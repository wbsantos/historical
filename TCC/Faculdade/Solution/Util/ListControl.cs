using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.Util
{
    public static class ListControl
    {
        public static void RefreshData(this System.Windows.Forms.ListControl list)
        {
            System.Windows.Forms.CurrencyManager myCurrencyManager = (System.Windows.Forms.CurrencyManager)list.BindingContext[list.DataSource];
            myCurrencyManager.Refresh();
        }
    }
}
