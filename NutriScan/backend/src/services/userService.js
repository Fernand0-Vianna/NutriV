// User service
const User = require('../models/User');
const { hashPassword, comparePassword } = require('../utils/helpers');

const registerUser = async (userData) => {
    const { name, email, password } = userData;
    let user = await User.findOne({ email });
    if (user) {
        throw new Error('Usuário já existe com este e-mail');
    }

    const passwordHash = await hashPassword(password);
    user = new User({
        name,
        email,
        passwordHash,
    });
    await user.save();
    return user;
};

const loginUser = async (email, password) => {
    const user = await User.findOne({ email });
    if (!user) {
        throw new Error('Credenciais inválidas');
    }

    const isMatch = await comparePassword(password, user.passwordHash);
    if (!isMatch) {
        throw new Error('Credenciais inválidas');
    }
    return user;
};

const getUserById = async (id) => {
    const user = await User.findById(id).select('-passwordHash'); // Exclui o hash da senha
    if (!user) {
        throw new Error('Usuário não encontrado');
    }
    return user;
};

// Outros métodos: updateUser, deleteUser, etc.

module.exports = {
    registerUser,
    loginUser,
    getUserById,
};