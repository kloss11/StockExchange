using FileHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockExchange
{
        [DelimitedRecord("|")]
        public class Orders
        {
            public int OrderID;

            public string CustomerID;

            [FieldConverter(ConverterKind.Date, "ddMMyyyy")]
            public DateTime OrderDate;

            [FieldConverter(ConverterKind.Decimal, ".")] // The decimal separator is .
            public decimal Freight;
        }
    }
