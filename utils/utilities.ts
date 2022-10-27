import { sign } from "jsonwebtoken";

export function generateToken(params = {}) {
  return sign(params, "b2fc25582af9861459837b12ed2a6742", {
    expiresIn: 86400,
  });
}