create or replace TRIGGER prevent_primary

before DELETE ON PAYOPTION for each row

begin
if :old.isPrimary='Y' then
raise_application_error(-20100, ' You can not delete the primary payment option you need to add another primary option before deleting this one.');
end if;
end prevent_primary;
