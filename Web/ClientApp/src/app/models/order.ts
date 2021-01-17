export interface Order {
    id: string;
    userId: string;
    size: number;
    address: string;
    phone: string;
    isCrispy: boolean;
    notes: string;
    state: number;
    trackingState: number;
    dateCreated: Date;
}
