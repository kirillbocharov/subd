CREATE OR REPLACE PROCEDURE DELETE_NEWS(p_id IN NUMBER)
AS
BEGIN
	DELETE FROM NEWS WHERE NEWS_ID = p_id;
	commit;
END DELETE_NEWS;
/