CREATE TABLE `projects` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `owner_user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `bin_id` varchar(255) DEFAULT NULL,
  `last_checked_in` datetime DEFAULT NULL,
  `last_checked_out` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (owner_user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;