CREATE TABLE `tool_logs` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `checkout_user_id` int(11),
    `tool_id` int(11),
    `tool_name` varchar(255),
    `checked_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `is_checking_in` boolean
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;