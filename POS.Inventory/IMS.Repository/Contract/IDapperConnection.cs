using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Repository.Contract
{
    public interface IDapperConnection
    {
        IDbConnection Database { get; }
        IDbConnection DatabaseContent { get; }
    }
}
