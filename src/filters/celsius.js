export default function(value, args) {
    let unit: any = ' °C';
    if (args) {
        unit = args;
    }
    return value + unit;
}