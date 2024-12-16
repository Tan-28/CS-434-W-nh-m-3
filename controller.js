const jwt = require("jsonwebtoken");
const usersList = [
  {
    username: "admin",
    password: "admin",
  },
  {
    username: "ktv",
    password: "ktv",
  },
];
const login = async (req, res) => {
  const { username, password } = req.body;

  let isValid = false;
  for (i = 0; i < usersList.length; i++) {
    if (
      username === usersList[i].username &&
      password === usersList[i].password
    ) {
      isValid = true;
      break;
    }
  }

  if (!isValid)
    return res.status(400).json({
      message: "Username or password invalid",
    });

  const token = jwt.sign(
    { username: username, password: password },
    process.env.ACCESS_TOKEN,
  );
  res.status(200).json({
    token: token,
  });
};

const register = async (req, res) => {
  const { username, password } = req.body;

  for (i = 0; i < usersList.length; i++) {
    if (username === usersList[i].username) {
      return res.status(400).json({
        message: "username exist",
      });
    }
  }

  usersList.push({
    username: username,
    password: password,
  });
  const token = jwt.sign(
    { username: username, password: password },
    process.env.ACCESS_TOKEN,
  );
  return res.status(200).json({
    token: token,
  });
};

module.exports = { login, register };
