insert into
    my_temporary_table
    (
        id,
        value_1,
        value_2,
        value_3,
        value_4
    )
values
    (
        1991,
        1,
        2,
        3,
        4
    ),
    (
        1992,
        5,
        6,
        7,
        8
    ),
    (
        1993,
        9,
        10,
        11,
        12
    );

insert into
    my_wide_table
values
    (
        get_last_id(),
        complex_expression_1 + complex_expression_2,
        long_expression_1 * long_expression_2 - long_expression_3
    );

-- ⚠️⚠️⚠️⚠️⚠️⚠️
update my_staff_size
-- ⚠️⚠️⚠️⚠️⚠️⚠️
set
    id = id + 1,
    name = 'a name',
    note = 'and a note',
    additional_note = 'Processed.',
    status = -1
where
    yr between 1996 and 2017
    and (q1 > 0 or q4 = 20)
    and exists
        (
            select
                *
            from
                my_permission
        )
    and exists
        (
            select
                *
            from
                my_applicable_entry x
            where
                my_staff_size.id = x.id
        )
    and actual is not null;


select
    max(q4)
from
    my_staff_size;

select distinct
    a,
    b,
    c
from
    my_staff_size;

select distinct
    *
from
    my_staff_size;


select
    id, -- an abstract identifier starting from 1
    alias, -- optional alias, nullable
    name, -- the name
    name_2, -- additional name if exists
    note, -- multi-line text
    tms -- timestamp (the long value from java's Date)
from
    my_table;


select
    d.dep_id,
    p.per_id,
    count(*) as per_cnt,
    max(m.actual) as has_actual_template
from
    department d
    join manager m
        on d.dep_id = m.dep_id
    left join person p
        on m.per_id = p.per_id,
    message m
    left outer join mark mk
        on m.id = mk.msg_id
    left join template tp
        on m.template_id = tp.id
where
    d.dep_id = m.dep_1
    and x = y
    and x2 = y2
group by
    d.dep_id,
    p.per_id
having
    count(*) >= 2
order by
    per_cnt desc;


select
    a.*
from
    small_table_1 a
    natural join small_table_2 b
    natural join small_table_3 c
    join medium_table_4 d
        using (id)
--- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
    left outer join medium_table_5 e
        on d.x = e.x and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17
            and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17 and d.yyy = 17
            and d.yyy = 17 and d.yyy = 17
--- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
    left outer join medium_table_6 f
        on e.y = f.y
    inner join medium_table_7 g
        on f.z = g.z;


select
    a.*,
    d.*,
    h.*
from
    small_table_1 a
    natural join small_table_2 b
    natural join small_table_3 c,
    medium_table_4 d
    left outer join medium_table_5 e
        using (x)
    left outer join medium_table_6 f
        using (y)
    inner join medium_table_7 g
        using (z),
    big_table_8 as h
-- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
    cross join (
                   select
                       42
                   from
                       dual
               ) as z0
-- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
    join another_table
        using (first_common_column, second_common_column);

delete
from
    message
where
    dep_id not in (
                      select
                          dep_id
                      from
                          department
                      where
                          actual is not null
                  );
--- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
create view v1
--- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
as
    select
        *
    from
        dual
    where
        42 is not null;
--- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
create table book
--- ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
(
    id int not null
        primary key,
    title varchar(160) not null,
    yr decimal(4)
        check (yr between -1000 and 2099)
);
