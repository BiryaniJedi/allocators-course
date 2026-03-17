const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const source = "hello, allocator";
    const c = try allocator.alloc(u8, source.len);
    defer allocator.free(c);

    @memcpy(c, source);
    std.debug.print("Result: {s}\n", .{c});
}
