﻿using IMS.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Repository.Contract
{
    public interface IUnitOfMeasuresRepository
    {
        List<Measures> Get();

        void Save(object parameter);

        void Delete(object parameter);
    }
}
