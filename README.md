# Social_Network_Database

## Project Overview

**Social Network Database** is a project designed to create a relational database schema for a social network application. This database records essential information about users, their activities, connections, and interactions within the network. It supports features for both individual users and companies, allowing for a comprehensive social networking experience.

## Features

### For Individual Users
- **Profile Creation**: Users can create profiles with their basic information, including name, surname, gender, date of birth, marital status, and hobbies (e.g., sports, reading).
- **Friendship Management**: Users can form friendships with other users, enabling profile viewing and interaction with each other's posts.
- **Content Posting**: Users can post various types of content, including photos, videos, and plain text updates, to share their experiences with their network.
- **Engagement**: Users can review, comment on, and like posts made by other users, facilitating discussions and interactions.
- **Group Activities**: Users can create or join groups based on common interests or activities, connecting with like-minded individuals.
- **Following Companies**: Users can follow companies to receive updates and news, staying informed about their products, services, and events.
- **Messaging**: Users can send messages to other users and companies, with timestamps for sent and read times to track communication status.

### For Companies
- **Profile Creation**: Companies can create profiles with basic information, including location, working hours, and website details, to inform users about their business.
- **Content Posting**: Companies can post news and updates on their profiles to keep users informed about their products, services, and events.
- **Follower Management**: Companies can be followed by users and other companies, allowing followers to receive updates and news.
- **Messaging**: Companies can receive messages from users and other companies, facilitating private communication and collaboration.

## Usage Scenarios

1. **Creating User Profiles**: Users can create profiles with detailed information and hobbies to connect with others.
2. **Forming Friendships**: Users can establish friendships to interact more closely with specific individuals.
3. **Posting and Engaging with Content**: Users can post updates and engage with others' posts through comments and likes.
4. **Joining Groups**: Users can join or create groups to engage with communities of shared interests.
5. **Following Companies**: Users can follow companies to stay updated on their latest news and offerings.
6. **Sending Messages**: Users and companies can communicate privately through messages, with read and sent timestamps.

## Example Queries

1. **Group Membership**: Determine which group a specific user (e.g., John Jackson) is part of.
2. **Marital Status Categories**: List all categories of marital status and their corresponding users, including categories with no users.
3. **User Age Calculation**: List all users, their birthdates, and their current age in years.
4. **Group Membership Count**: Determine the number of members in each group.
5. **Company Followers**: Identify which company has the most followers.
6. **Group Name Update**: Change the name of a specific group (e.g., "FERI group" to "FERI group 2020").
7. **Deleting a User**: Remove a specific user (e.g., Carol Jacobson) from the database.

## Potential Issues and Considerations

- **Timestamp Handling**: Ensure that the timestamp for sent and read times in messages is accurate and correctly formatted.
- **Follower and Group Member Count**: Implement efficient counting mechanisms for followers and group members.
- **Content Types**: Manage different types of content (photos, videos, plain text) within the posts effectively.

## Conclusion

This project provides a comprehensive and structured approach to setting up a social network database. It supports a wide range of functionalities for users and companies, ensuring robust data management and interaction capabilities. Whether for personal connections, group activities, or following company updates, this database schema is designed to meet diverse social networking needs.
