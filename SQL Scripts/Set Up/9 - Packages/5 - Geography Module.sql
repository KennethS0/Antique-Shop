DELIMITER ;;
-- Lets a user leave a review of how the interaction was with
-- the other user during the transaction.
DROP PROCEDURE IF EXISTS Insertion_LeaveReview;
CREATE PROCEDURE Insertion_LeaveReview (pDescription TEXT,
										pNumStars FLOAT,
										pUser_Reviewed_id INT)
BEGIN
	INSERT INTO review (description,
						num_starts,
                        user_reviewed_id)
	VALUES
		(pDescription,
         pNumStars,
         pUse_Reviewed_id);
END;;