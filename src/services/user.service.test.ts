import { describe, expect, it } from "vitest";
import { calculateDiscount, formatUserDisplay } from "./user.service";

describe("calculateDiscount", () => {
  it("gives 20% discount to seniors (60+)", () => {
    expect(calculateDiscount(100, 65)).toBe(20);
  });

  it("gives 10% discount to adults (18-59)", () => {
    expect(calculateDiscount(100, 30)).toBe(10);
  });

  it("gives no discount to minors", () => {
    expect(calculateDiscount(100, 15)).toBe(0);
  });
});

describe("formatUserDisplay", () => {
  it("formats user correctly", () => {
    const user = { id: 1, name: "Alice", email: "alice@test.com", age: 28 };
    expect(formatUserDisplay(user)).toBe("Alice (alice@test.com)");
  });
});
