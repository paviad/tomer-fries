export interface Order {
    id: string;
    userId: string;
    address: string;
    phone: string;
    isCrispy: boolean;
    notes: string;
    state: number;
    dateCreated: Date;
}
