CREATE TABLE Registered_Users(
	username	CHAR(20),
	password	CHAR(20),
	email		CHAR(20),
	name		CHAR(20),
	dob			DATE,
	gender		CHAR,
	income		REAL,
	contact_id	CHAR(20),
	card_no		CHAR(16),
	PRIMARY KEY (username),
);

CREATE TABLE Contact_Info(
	contact_id	CHAR(20),
	street		CHAR(20),
	city		CHAR(20),
	state		CHAR(2),
	zip			CHAR(5),
	phone		CHAR(10),
	PRIMARY KEY (contact_id)
);

CREATE TABLE Payment_Info(
	card_no		CHAR(16),
	type		CHAR(10),
	exp_date	DATE,
	PRIMARY KEY (card_no)
);

CREATE TABLE Seller(
	username	CHAR(20),
	PRIMARY KEY(username),
	FOREIGN KEY(username) REFERENCES Registered_Users(username)
);

CREATE TABLE Supplier(
	username	CHAR(20),
	cname			CHAR(20),
	p_contact		CHAR(20),
	contact_id		CHAR(20),
	category		CHAR(20),
	revenue			REAL,
	PRIMARY KEY(username),
	FOREIGN KEY(username) REFERENCES Seller(username)
);

CREATE TABLE Rating(
	rating_id	CHAR(20),
	description	CHAR(20),
	user_about	CHAR(20),
	user_write	CHAR(20),
	PRIMARY KEY(rating_id, user_about, user_write),
	FOREIGN KEY(user_about) REFERENCES Registered_Users(username)
		ON DELETE CASCADE,
	FOREIGN KEY(user_write) REFERENCES Registered_Users(username)
);

CREATE TABLE Sale_Item(
	item_id			CHAR(20),
	description		CHAR(20),
	PRIMARY KEY(item_id)
);

CREATE TABLE Sale(
	list_price	REAL,
	location	CHAR(20),
	trans_date	DATE,
	item_id		CHAR(20),
	user_buyer	CHAR(20),
	user_seller	CHAR(20),
	PRIMARY KEY(item_id, user_buyer, user_seller),
	FOREIGN KEY(item_id) REFERENCES Sale_Item(item_id),
	FOREIGN KEY(user_buyer) REFERENCES Registered_Users(username),
	FOREIGN KEY(user_seller) REFERENCES Seller(username)
);

CREATE TABLE Auction(
	reserve_price	REAL,
	highest_bid		REAL,
	location		CHAR(20),
	trans_date		DATE,
	item_id			CHAR(20),
	user_buyer		CHAR(20),
	user_seller		CHAR(20),
	PRIMARY KEY(item_id, user_buyer, user_seller),
	FOREIGN KEY(item_id) REFERENCES Sale_Item(item_id),
	FOREIGN KEY(user_buyer) REFERENCES Registered_Users(username),
	FOREIGN KEY(user_seller) REFERENCES Seller(username)
);




