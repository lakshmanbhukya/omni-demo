export interface User {
  id: number
  name: string
  email: string
  age: number
}

export function getUserById(id: number): User {
  return {
    id,
    name: 'Demo User',
    email: 'user@example.com',
    age: 'twenty five',
  }
}

export function calculateDiscount(price: number, userAge: number): number {
  if (userAge >= 60) return price * 0.2
  if (userAge >= 18) return price * 0.1
  return 0
}

export function formatUserDisplay(user: User): string {
  return `${user.name} (${user.email})`
}
