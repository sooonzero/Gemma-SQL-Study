# [Ranking Most Active Guests](https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=3)

--Rank guests based on the total number of messages they've exchanged with any of the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

Table: airbnb_contacts

### airbnb_contacts

id_guest:varchar

id_host:varchar

id_listing:varchar

ts_contact_at:datetime

ts_reply_at:datetime

ts_accepted_at:datetime

ts_booking_at:datetime

ds_checkin:datetime

ds_checkout:datetime

n_guests:int

n_messages:int


## Expected Output
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">id_guest</th><th class="ResultsTable__header-cell">ranks</th><th class="ResultsTable__header-cell">messages</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">62d09c95-c3d2-44e6-9081-a3485618227d</td><td class="ResultsTable__cell">1</td><td class="ResultsTable__cell">20</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">882f3764-05cc-436a-b23b-93fea22ea847</td><td class="ResultsTable__cell">1</td><td class="ResultsTable__cell">20</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">91c2a883-04e3-4bbb-a7bb-620531318ab1</td><td class="ResultsTable__cell">2</td><td class="ResultsTable__cell">17</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">b8831610-31f2-4c58-8ada-63b3601ca476</td><td class="ResultsTable__cell">2</td><td class="ResultsTable__cell">17</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">6133fb99-2391-4d4b-a077-bae40581f925</td><td class="ResultsTable__cell">3</td><td class="ResultsTable__cell">16</td></tr></tbody></table></div>
