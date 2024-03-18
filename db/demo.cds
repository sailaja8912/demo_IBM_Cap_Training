namespace com.ibm;
using { demo.reuse as reuseData } from './reuse';
using { cuid,temporal,managed } from '@sap/cds/common';



context demo {
    
    //consume aspect to get the address field added to employee table automatically
    entity student: reuseData.address {
        key id: reuseData.Guid;
        firstName: String(80);
        lastName: String(80);
        // Create foreign key relationship between tables
        grade: Association to one class;
        gender: String(1);
    }


    entity class {
        key id: Int16;
        className: String(80);
        semester: Int16;
        specialization: String(60);
    }
    
    entity book {
        key id: reuseData.Guid;
        bookName: localized String(80);
        author: String(80);
    }
}


context trans {
    
    entity subs: cuid, temporal, managed {
        // key id: reuseData.Guid;
        student: Association to one demo.student;
        book: Association to one demo.book;
    }
}
