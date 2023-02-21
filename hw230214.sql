SELECT
users.fullname, messages.text
from chats
left join messages on messages.chat_id = chats.chat_id
left join users on 
	case
	WHEN chats.user1_id = 1 THEN chats.user2_id
	WHEN chats.user2_id = 1 THEN chats.user1_id
	end = users.user_id
where (user1_id = 1 or user2_id =1)
-- work was not finished --