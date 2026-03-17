const std = @import("std");

pub fn main() !void {
    // ??? classify this:
    // Stack. Value is known at compile time, no alloc used
    const a: u64 = 100;

    // ??? classify this:
    // Stack. Value is known at compile time, no alloc used
    const b: [512]u8 = undefined;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // ??? classify this:
    // Heap. Alloc used.
    const c = try allocator.alloc(u8, 512);
    defer allocator.free(c);

    // ??? classify this:
    // Heap. Alloc used.
    const d = try allocator.create(u64);
    defer allocator.destroy(d);

    _ = a;
    _ = b;
    std.debug.print("ok\n", .{});
}
