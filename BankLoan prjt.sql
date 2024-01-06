use asish;
 create view abc as (
 select year,concat(ls," (",cnt,")") loan_stat,case
                          when amount>999999 then concat(left(amount,length(amount)-6),"M")
						  else concat(left(amount,length(amount)-3),"K") end as amnt from (
 select issue_d as year,loan_status as ls,count(loan_status) as cnt,sum(loan_amnt)amount from f1
 group by issue_d,loan_status
 order by issue_d)sq);
 select * from abc;
 
 create view aq as(
 select grade,sub_grade, case when amnt>999999 then concat(left(amnt,length(amnt)-6),"M")
 else concat(left(amnt,length(amnt)-3),"K") 
 end as revol_bal from(
 select grade,sub_grade , sum(revol_bal) amnt  from f1 join f2 
 on f1.id=f2.id
 group by grade,sub_grade
 order by grade)a) ;
 select * from aq;
 
 create view tr as(
 select verification_status, concat(left(amnt,length(amnt)-6),"M") revol_bal from(
 select verification_status,ceil(sum(total_pymnt))amnt from 
 f1 join f2 on
 f1.id=f2.id
 group by verification_status)x);
 select * from tr;
 
 create view mah as (
select month_name,addr_state,concat(loan_status,"   (",ls,")") status_of_loan from(
select month,`issue_d_[0]` month_name, addr_state, loan_status ,count(loan_status)ls from f1
group by month,month_name,addr_state,loan_status
order by month)g);
 select * from mah;
 
 create view nn as (
 select last_pmnt_m last_pmt_d , concat(home_ownership," (",count(home_ownership),")")Home_own,sum(loan_amnt)Amount
 from f1 join f2 on f1.id=f2.id
 group by last_pmnt_m,home_ownership 
 order by last_pmnt_m);
 select * from nn;
 
 create view sp as (
 select purpose , case when amnt>999999 then concat(left(amnt,length(amnt)-6),"M")
			      else concat(left(amnt,length(amnt)-3),"K") end as loan_amount from (
 select purpose, sum(loan_amnt)amnt from f1
 group by purpose)x);
 select * from sp;
 
 select * from abc;
 select * from aq;
 select * from tr;
 select * from sp;
 select * from mah;
 select * from nn;